import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/core/models/user.dart';
import 'package:suitmedia_application_test/src/core/services/user_service.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/custom_appbar.dart';
import 'package:suitmedia_application_test/src/features/common/widgets/loading_indicator.dart';
import 'package:suitmedia_application_test/src/features/third_screen/widgets/error_dialog.dart';
import 'package:suitmedia_application_test/src/features/third_screen/widgets/profile_tile.dart';

/// ThirdScreen Class
///
/// The third screen of the application according to the task requirements, that is:
///   a. a. It has a List / Table view of Users
///   b. Collect data from api from regres.in with email, first_name,
///      last_name & avatar
///   c. Add a pull to refresh and load the next page when scrolling to the
///      bottom of the list, and prepare an empty state if data is empty.
///      You can use the API with adding parameter page & per_page to get
///      next page data.
///   d. When a User on an item list is clicked, the "Selected User Name" label
///      in [SecondScreen] will be replaced by the selected User’s name
///      (don’t create a new screen, just continue the current screen).
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
  late int _perPageNumber;
  late List<User> _userProfiles;

  @override
  void initState() {
    _pageNumber = 1;
    _perPageNumber = 10;
    _isLoading = false;
    _isBottomLoading = false;
    _bottomLoadingError = false;
    _userProfiles = [];
    _loadData();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  /// Loads initial data from the [UserService].
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
        perPage: _perPageNumber,
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

  /// Listens to the scroll position to trigger the loading of
  /// more data when reaching the bottom.
  void _scrollListener() {
    if (!_isLoading &&
        !_isBottomLoading &&
        !_bottomLoadingError &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _loadBottomData();
    }
  }

  /// Loads additional data when reaching the bottom of the list.
  Future<void> _loadBottomData() async {
    setState(() {
      _isBottomLoading = true;
      _bottomLoadingError = false;
    });

    try {
      final List<User> newData = await _userService.fetchData(
        page: _pageNumber,
        perPage: _perPageNumber,
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

  Widget _buildUserContainer(User user) {
    return UserContainer(
      user: user,
      onTap: () {
        Navigator.of(context).pop("${user.firstName} ${user.lastName}");
      },
    );
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
                          return _buildUserContainer(_userProfiles[index]);
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
