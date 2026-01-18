import 'package:flutter/material.dart';
import 'package:flutter_application_starter/services/network_service.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  final service = NetworkService();
  bool? isOnline;

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    final status = await service.isOnline();
    setState(() => isOnline = status);
  }

  @override
  Widget build(BuildContext context) {
    if (isOnline == null) {
      return CircularProgressIndicator();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isOnline! ? Icons.wifi : Icons.wifi_off,
            size: 48,
            color: isOnline! ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 12),
          Text(
            isOnline! ? "Online" : "Offline",
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
