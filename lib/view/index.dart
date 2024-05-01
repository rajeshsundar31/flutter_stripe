import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hush_day/bloc/joke_bloc/joke_bloc.dart';
import 'package:hush_day/bloc/user_list/user_bloc.dart';
import 'package:hush_day/service/bloc_service.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserService>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Joke App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              return ListView.builder(
                // itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${state.user.body}',
                              style: const TextStyle(color: Colors.white),
                            ),

                            subtitle: Text(
                              '${state.user.title}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            
                            // leading: CircleAvatar(
                            //   backgroundImage: NetworkImage(
                            //       userList[index].avatar.toString()),
                            // )
                            ))
                            );
            }
                            );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}