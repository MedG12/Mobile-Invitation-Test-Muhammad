import 'package:compentency_test_muhammad/presentations/providers/user_selection_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<UserSelectionViewmodel>();

      
      final screenHeight = MediaQuery.of(context).size.height;
      const appBarHeight = kToolbarHeight; 
      const itemHeight = 72.0; 

      final usableHeight = screenHeight - appBarHeight;
      final itemCount = (usableHeight / itemHeight).ceil();

      viewModel.perPage = itemCount;
      viewModel.reset();
      viewModel.fetchUsers();
    });

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final viewModel = context.read<UserSelectionViewmodel>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !viewModel.isLoading &&
        !viewModel.reachEnd) {
      viewModel.fetchUsers();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserSelectionViewmodel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Users"),
      ),
      body: Column(
        children: [
          const Divider(height: 1.0, thickness: 0.5, color: Colors.grey),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Panggil reset() untuk clear data lama dan muat ulang dari halaman 1
                viewModel.reset();
                await viewModel.fetchUsers();
              },
              child: _buildMainContent(
                viewModel,
              ), // Pindahkan logika ListView ke method terpisah
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(UserSelectionViewmodel viewModel) {
    if (viewModel.isLoading && viewModel.users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(child: Text("Error: ${viewModel.error}"));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: viewModel.users.length + 1,
      itemBuilder: (context, index) {
        if (index < viewModel.users.length) {
          final user = viewModel.users[index];
          return ListTile(
            leading: SizedBox(
              width: 45,
              height: 45,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.url ?? ''),
              ),
            ),
            title: Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              user.email ?? '',
              style: const TextStyle(fontSize: 15),
            ),
            onTap: () {
              viewModel.selectedUser = user;
              context.pop();
            }, // Tambahkan handler klik
          );
        } else {
          return viewModel.reachEnd
              ? const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text("No more users")),
              )
              : const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
        }
      },
    );
  }
}
