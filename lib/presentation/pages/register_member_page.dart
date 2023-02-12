import 'package:flutter/material.dart';

class RegisterMember extends StatefulWidget {
  const RegisterMember({super.key});

  @override
  State<RegisterMember> createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerAge = TextEditingController();
    TextEditingController controllerAddress = TextEditingController();
    TextEditingController controllerService = TextEditingController();
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registrasi Anggota'),
      ),
      body: Center(
          child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: controllerName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Lengkap',
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    controller: controllerAge,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Usia',
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: controllerAddress,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Alamat Lengkap',
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 10,
                  ),
                  TextField(
                    controller: controllerService,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Layanan',
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: controllerPhone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nomor Telepon',
                    ),
                    maxLength: 14,
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controllerEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Alamat Email',
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: (() {}),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
