import 'package:beegains/bloc/home_bloc.dart';
import 'package:beegains/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    print(widget.token.substring(4));
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Enquery Details'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isApiFetching) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            if (state.result != null) {
              List<Datum> data = state.result!.data!.enquiries!.data!;
              return ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) => UserCard(data: data[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
