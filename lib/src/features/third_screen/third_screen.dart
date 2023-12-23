import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/models/user.dart';
import 'package:suitmedia_application_test/src/core/services/user_service.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/custom_appbar.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/loading_indicator.dart';
import 'package:suitmedia_application_test/src/features/third_screen/widgets/error_dialog.dart';
import 'package:suitmedia_application_test/src/features/third_screen/widgets/profile_tile.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final UserService _userService = UserService();
  final ScrollController _scrollController = ScrollController();
  late bool _isLoading;
  late bool _isBottomLoading;
  late bool _bottomLoadingError;
  late int _pageNumber;
  late List<User> _userProfiles;

  @override
  void initState() {
    _pageNumber = 1;
    _isLoading = false;
    _isBottomLoading = false;
    _bottomLoadingError = false;
    _userProfiles = [];
    _loadData();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> _loadData() async {
    if (_isLoading || _isBottomLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final List<User> newData = await _userService.fetchData(
        page: _pageNumber,
        perPage: 10,
      );

      setState(() {
        _userProfiles.addAll(newData);
        _pageNumber++;
      });
    } catch (error) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog();
          },
        );
      }
    } finally {
      if (context.mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _scrollListener() {
    if (!_isLoading &&
        !_isBottomLoading &&
        !_bottomLoadingError &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _loadBottomData();
    }
  }

  Future<void> _loadBottomData() async {
    setState(() {
      _isBottomLoading = true;
      _bottomLoadingError = false;
    });

    try {
      final List<User> newData = await _userService.fetchData(
        page: _pageNumber,
        perPage: 10,
      );

      setState(() {
        _userProfiles.addAll(newData);
        _pageNumber++;
      });
    } catch (error) {
      setState(() {
        _bottomLoadingError = true;
      });
    } finally {
      if (context.mounted) {
        setState(() {
          _isBottomLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenteredAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: "Third Screen",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _pageNumber = 1;
          _userProfiles.clear();
          await _loadData();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: _isLoading && _userProfiles.isEmpty
              ? const CenteredLoadingIndicator()
              : _userProfiles.isEmpty
                  ? const Center(
                      child: Text("Sorry, no data available"),
                    )
                  : ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index < _userProfiles.length) {
                          return UserContainer(
                            user: _userProfiles[index],
                            onTap: () {
                              Navigator.of(context).pop(
                                  "${_userProfiles[index].firstName} ${_userProfiles[index].lastName}");
                            },
                          );
                        } else if (_bottomLoadingError) {
                          return const Center(
                            child: Text("Error loading more data."),
                          );
                        } else {
                          return const CenteredLoadingIndicator();
                        }
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                      itemCount: _userProfiles.length +
                          (_isBottomLoading ? 1 : 0) +
                          (_bottomLoadingError ? 1 : 0),
                    ),
        ),
      ),
    );
  }
}
