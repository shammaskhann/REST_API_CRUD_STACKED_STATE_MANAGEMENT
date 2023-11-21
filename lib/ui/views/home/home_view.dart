import 'package:api_crud_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (viewModel) => viewModel.getPost(),
        builder: ((context, viewModel, child) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      child: SvgPicture.asset(
                    'assets/splash/rest-api-icon.svg',
                  )),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('Messages'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Profile'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Logout'),
                    onTap: () {
                      viewModel.logout();
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Home (GET API)'),
              centerTitle: true,
            ),
            body: (!viewModel.isBusy)
                ? ListView.builder(
                    itemCount: viewModel.unicorns.length,
                    itemBuilder: (context, index) {
                      if (viewModel.unicorns.isEmpty) {
                        return const Center(
                          child: Text('No Data Found'),
                        );
                      }
                      if (viewModel.isBusy) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      }
                      return ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.lightBlue,
                            child: SvgPicture.asset(
                              'assets/splash/rest-api-icon.svg',
                              height: 30,
                            ),
                          ),
                          title:
                              Text(viewModel.unicorns[index].name ?? "No Name"),
                          subtitle: Text(
                              viewModel.unicorns[index].colour ?? "No Color"),
                          trailing: DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                    value: 'Edit', child: Text('Edit')),
                                DropdownMenuItem(
                                    value: 'Delete', child: Text('Delete')),
                              ],
                              onChanged: (value) {
                                final String id =
                                    viewModel.unicorns[index].sId!;
                                if (value == 'Edit') {
                                  final nameEditController =
                                      TextEditingController(
                                          text: viewModel.unicorns[index].name);
                                  final ageEditController =
                                      TextEditingController(
                                          text: viewModel.unicorns[index].age
                                              .toString());
                                  final colourEditController =
                                      TextEditingController(
                                          text:
                                              viewModel.unicorns[index].colour);
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              const Text("PUT API",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center),
                                              TextField(
                                                controller: nameEditController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'Enter Name'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextField(
                                                controller: ageEditController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'Enter Age'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextField(
                                                controller:
                                                    colourEditController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText:
                                                            'Enter Color'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    viewModel.updatePost(
                                                        id,
                                                        nameEditController.text,
                                                        int.parse(
                                                            ageEditController
                                                                .text),
                                                        colourEditController
                                                            .text);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      'Update Unicorn'))
                                            ],
                                          ),
                                        );
                                      });
                                } else if (value == 'Delete') {
                                  viewModel.deletePost(id);
                                }
                              }));
                    })
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // add new unicirn through bottomsheet taking input
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const Text("POST API",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            TextField(
                              controller: viewModel.nameController,
                              decoration:
                                  const InputDecoration(hintText: 'Enter Name'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: viewModel.ageController,
                              decoration:
                                  const InputDecoration(hintText: 'Enter Age'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: viewModel.colourController,
                              decoration: const InputDecoration(
                                  hintText: 'Enter Color'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  viewModel.addPost();
                                  Navigator.pop(context);
                                },
                                child: const Text('Add Unicorn'))
                          ],
                        ),
                      );
                    });
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}
