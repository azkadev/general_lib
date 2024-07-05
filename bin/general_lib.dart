/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// /* <!-- START LICENSE -->

// Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION
// Social Media:

// - Youtube: https://youtube.com/@Global_Corporation
// - Github: https://github.com/globalcorporation
// - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

// Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

// Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

// Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

// Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

// Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
// Karena jika ada negosiasi harga kemungkinan

// 1. Software Ada yang di kurangin
// 2. Informasi tidak lengkap
// 3. Bantuan Tidak Bisa remote / full time (Ada jeda)

// Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

// jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ?
// Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap

// <!-- END LICENSE --> */
// // ignore_for_file: unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps

// import 'dart:io';

// import 'package:alfred/alfred.dart';

// import 'package:general_lib/cli/cli.dart';
// import 'package:general_lib/cli/scheme/scheme.dart';
// import 'package:mason_logger/mason_logger.dart';
// import "package:general_lib/general_lib.dart";
// import "package:path/path.dart";

// void main(List<String> args_raw) async {
//   GeneralLibCli generalLibCli = GeneralLibCli();

//   await generalLibCli.init();
//   // Directory directory = Directory(base_directory_lib.path);
//   Directory directory_lib =
//       Directory(join(generalLibCli.base_directory.path, "lib"));
//   // Directory directory_template = Directory(join(generalLibCli.base_directory.path, "template"));
//   Directory directory_template = Directory(
//       (Platform.environment["path_template"]) ??
//           (join(generalLibCli.base_directory.path, "template")));

//   if (!directory_template.existsSync()) {
//     await directory_template.create(recursive: true);
//   }
//   Args args = Args(args_raw);

//   // List<String> args_lowercase = arguments.map((e) => e.toLowerCase()).toList().cast<String>();
//   String name_exe = "general_cli";
//   String help_msg = """
// A command-line general_cli.

// Usage: ${name_exe} <command> [arguments]

// Global options:
//   help                 Print this usage information.
//   version              Print the Userbot version.
//   reload               Reload package general_cli

// Available commands:
//   create     Create a new Dart project.
//   list_template list template
//   github run github
//   xendit run xendit
//   live_server live server
//   env
//   clean

// Run "${name_exe} help <command>" for more information about a command.
// See  for detailed documentation and tutorial.
// """;
//   String help_github = """
// Create a new ${name_exe} project.

// Environment:

// - github_token github token api key wajib

// Usage: ${name_exe} create <directory> [arguments]
//   -token      github token wajib
//   -org xendit org opsional
//   -method

// Run "${name_exe} help" to see global options.
// """;
//   String help_xendit = """
// Create a new ${name_exe} project.

// Environment:

// - xendit_token xendit token api key wajib

// Usage: ${name_exe} create <directory> [arguments]
//   -token      xendit token wajib
//   -user_id    user id xendit opsional
//   -method

// Run "${name_exe} help" to see global options.
// """;

//   List<String> commands = [
//     "help",
//     "version",
//     "create",
//     "clean",
//     "install",
//     "list_template",
//     "live_server",
//     "reload",
//     "github",
//     "xendit",
//     "env",
//     "upload",
//   ];

//   if (args.arguments.isEmpty) {
//     logger.info(help_msg);
//     try {
//       String command = logger.chooseOne(
//         "Silahkan Pilih Commands",
//         choices: commands,
//       );

//       args.arguments = [command];
//     } catch (e) {
//       exit(0);
//     }
//   }
//   bool args_is_to_json = args.contains([
//     "--toJson",
//     "--tojson",
//     "-toJson",
//     "-tojson",
//   ]);
//   bool args_is_force = args.contains(["-f", "--force"]);
//   bool args_is_verbose = args.contains(["-v", "--verbose"]);
//   bool args_is_help = args.contains(["-h", "--help"]);
//   String? output_data = args["-o"];
//   File file_output =
//       File(output_data ?? join(Directory.current.path, "output.json"));
//   String command = args[0] ?? "";

//   String sub_command = args.after(command) ?? "";

//   if (command == "help") {
//     try {
//       args.arguments.removeAt(0);
//     } catch (e) {
//       logger.info(e.toString());
//     }
//     if (args_is_help) {
//     } else {
//       args_is_help = true;
//       args.arguments.add("-h");
//     }
//     command = args[0] ?? "help";
//   }

//   if (!commands.contains(command.toLowerCase())) {
//     logger.info(help_msg);
//     exit(0);
//   }
//   bool isSucces = false;
//   if (command == "reload") {
//     Directory directory_pub =
//         Directory(join(generalLibCli.base_directory.path, ".dart_tool", "pub"));
//     if (directory_pub.existsSync()) {
//       await directory_pub.delete(recursive: true);
//     }
//     logger.info("Succes Reload");
//     exit(0);
//   }

//   if (command == "clean") {
//     Progress progress = logger.progress("Procces Clean");
//     Future<void> cleanFolder(Directory directory, bool is_current) async {
//       progress.update("dir: ${directory.path}");

//       try {
//         List<FileSystemEntity> dirs = directory.listSync();
//         for (var i = 0; i < dirs.length; i++) {
//           FileSystemEntity dir = dirs[i];
//           try {
//             if (dir is Directory) {
//               if ([
//                 ".dart_tool",
//                 "build",
//               ].contains(basename(dir.path))) {
//                 if (is_current) {
//                   if ([
//                     "build",
//                   ].contains(basename(dir.path))) {
//                     dir.deleteSync(recursive: true);
//                   }
//                 } else {
//                   dir.deleteSync(recursive: true);
//                 }
//               } else {
//                 await cleanFolder(dir.absolute, false);
//               }
//             }
//           } catch (e) {}
//         }
//       } catch (e) {}
//     }

//     await cleanFolder(Directory.current, true);

//     progress.complete("Finished Clean");
//     exit(0);
//   }

//   if (command == "version") {
//     logger.info(
//         "general_cli version: 0.0.0 (stable) on ${Platform.operatingSystem}");
//     exit(0);
//   }

//   if (command == "live_server") {
//     int? port = int.tryParse(
//         args["-port"] ?? args["-p"] ?? generateUuid(4, text: "012345678"));
//     port ??= int.parse(generateUuid(4, text: "012345678"));
//     String host = Platform.environment["HOST"] ?? "0.0.0.0";

//     Alfred app = Alfred();
//     Directory directory = Directory.current;
//     app.get('/*', (req, res) => directory);
//     app.get('/*', (req, res) {
//       String path_folder = joinAll([
//         directory.path,
//         ...req.uri.pathSegments,
//       ]);
//       File file = File(path_folder);
//       if (file.existsSync()) {
//         return file;
//       } else {
//         File file_html = File(joinAll([
//           directory.path,
//           "index.html",
//         ]));
//         if (file_html.existsSync()) {
//           return file_html;
//         }
//       }

//       Directory directory_folder = Directory(path_folder);
//       List<FileSystemEntity> dirs = directory_folder.listSync();
//       String message = "";
//       for (var i = 0; i < dirs.length; i++) {
//         FileSystemEntity dir = dirs[i];
//         if (dir is Directory) {
//           message += "\n${dir.runtimeType.toString()}: ${dir.path}";
//         } else if (dir is File) {
//           message += "\n${dir.runtimeType.toString()}: ${dir.path}";
//         }
//       }

//       return message;
//     });

//     await app.listen(
//       port,
//       host,
//     );

//     logger.info(
//         "server Websocket on: http://${app.server!.address.address}:${app.server!.port}");
//     String? ip_host = await () async {
//       final interfaces = await NetworkInterface.list(
//           type: InternetAddressType.IPv4, includeLinkLocal: true);

//       try {
//         NetworkInterface interface = interfaces.singleWhere((element) =>
//             RegExp("^wl", caseSensitive: false).hasMatch(element.name));
//         return interface.addresses.first.address;
//       } catch (ex) {
//         try {
//           NetworkInterface interface =
//               interfaces.firstWhere((element) => element.name == "eth0");
//           return interface.addresses.first.address;
//         } catch (e) {
//           // Try any other connection next
//           try {
//             NetworkInterface interface = interfaces
//                 .firstWhere((element) => !(["wlan0"].contains(element.name)));
//             return interface.addresses.first.address;
//           } catch (ex) {
//             return null;
//           }
//         }
//       }
//     }();
//     logger.info("server Websocket on: http://${ip_host}:${app.server!.port}");

//     return;
//   }
//   if (command == "list_template") {
//     logger.info("Get Templates on ${directory_template.path}");

//     TemplateDatas templateDatas = await generalLibCli.getTemplatesByDirectory(
//       template_directory: directory_template,
//     );
//     for (var i = 0; i < templateDatas.templates.length; i++) {
//       TemplateData templateData = templateDatas.templates[i];
//       logger.info("\t${templateData.name}");
//     }
//     logger.info("\tfull_stack_template");
//     exit(0);
//   }
//   if (command == "create") {
//     if (args_is_help) {
//       String help_create = """
// Create a new ${name_exe} project.

// Usage: ${name_exe} create <directory> [arguments]
//   -f --force                      Force project generation, even if the target directory already exists.
//   -t --template ${directory_template.listSync().where((FileSystemEntity fileSystemEntity) {
//                 return (fileSystemEntity.statSync().type ==
//                     FileSystemEntityType.directory);
//               }).map((e) => basename(e.path)).toList().join("|")}

// Run "${name_exe} help" to see global options.
// """;
//       logger.info(help_create);
//       exit(0);
//     }

//     try {
//       if (sub_command.isEmpty) {
//         String name_project = logger.prompt("Name Project? :");

//         while (true) {
//           if (name_project.isEmpty) {
//             name_project = logger.prompt("Name Project? :");
//           } else {
//             break;
//           }
//         }
//         sub_command = name_project;
//       }
//       List<String> templates = () {
//         if (args["-t"] != null && (args["-t"] as String).isNotEmpty) {
//           return args["-t"]!.split(",");
//         } else if (args["--template"] != null &&
//             (args["--template"] as String).isNotEmpty) {
//           return args["--template"]!.split(",");
//         }

//         List<String> templates_files = [
//           "full_stack_template",
//           ...directory_template
//               .listSync()
//               .map((e) => basename(e.path))
//               .whereType<String>()
//               .toList()
//         ];

//         return logger.chooseAny(
//           "Silahkan Pilih Project",
//           choices: templates_files,
//           defaultValues: null,
//         );
//       }();
//       if (templates.isEmpty) {
//         templates = [
//           "app_template",
//         ];
//       }
//       if (templates.first == "full_stack_template") {
//         templates = [
//           "app_template",
//           "app_server_template",
//           "server_template",
//           "client_template",
//         ];
//       }
//       templates.remove("full_stack_template");
//       bool is_force = () {
//         if ((args.arguments.contains("-f") ||
//             args.arguments.contains("--force"))) {
//           return true;
//         }
//         if (Directory(join(Directory.current.path, sub_command)).existsSync()) {
//           return logger
//               .confirm("Project ${sub_command} Sudah ada apakah anda yakin?");
//         }
//         return false;
//       }();
//       ProjectData projectData = await generalLibCli.createTemplateByDirectory(
//         name: sub_command,
//         templates: templates,
//         is_force: is_force,
//         template_directory: directory_template,
//         directory_out: Directory.current,
//         onProcces: (String data) async {
//           logger.info(data);
//         },
//       );
//       if (projectData["@type"] == "error") {
//         logger.err(projectData["description"]);
//         exit(0);
//       }

//       logger.success(projectData.message);
//       exit(0);
//     } catch (e) {
//       logger.info(e.toString());
//       exit(0);
//     }
//   }

// //   if (command == "install") {
// //     if (args_is_help) {
// //       String help_install = """
// // Create a new ${name_exe} project.

// // Usage: ${name_exe} create <directory> [arguments]
// //   -f --force                      Force project generation, even if the target directory already exists.
// //   -t --template ${directory_template.listSync().where((FileSystemEntity fileSystemEntity) {
// //                 return (fileSystemEntity.statSync().type == FileSystemEntityType.directory);
// //               }).map((e) => basename(e.path)).toList().join("|")}

// // Run "${name_exe} help" to see global options.
// // """;
// //       logger.info(help_install);
// //       exit(0);
// //     }

// //     try {
// //       String templates = () {
// //         List<String> templates_files = [
// //           "dockerfile",
// //           "package",
// //         ];

// //         return logger.chooseOne(
// //           "Silahkan Pilih Type Install : ",
// //           choices: templates_files,
// //           defaultValue: "package",
// //         );
// //       }();
// //       // if (templates == "dockerfile") {}
// //       if (templates == "dockerfile") {
// //         List<DockerPlugin> dockerPluginsInstalls = () {
// //           while (true) {
// //             List<DockerPlugin> dockerPluginsInstalls = logger.chooseAny(
// //               "Silahkan Pilih Type Docker Plugin : ",
// //               choices: dockerPlugins,
// //               display: (choice) {
// //                 return choice.name ?? "unknown";
// //               },
// //             );
// //             if (dockerPluginsInstalls.isNotEmpty) {
// //               return dockerPluginsInstalls;
// //             }
// //           }
// //         }();

// //         File file_docker = File(join(Directory.current.path, "Dockerfile"));

// //         if (!file_docker.existsSync()) {
// //           logger.err("File Docker Not Found");
// //           exit(0);
// //         }
// //         Progress progress = logger.progress("Installing Plugin");
// //         for (var i = 0; i < dockerPluginsInstalls.length; i++) {
// //           DockerPlugin dockerPlugin = dockerPluginsInstalls[i];
// //           progress.update("Install Plugin: ${dockerPlugin.name}");
// //           await Docker().addPluginFromFile(dockerFile: file_docker, dockerPlugin: dockerPlugin);
// //         }
// //         progress.complete("Finished");
// //         logger.success("Succes Install Docker: ${file_docker.path}");

// //         exit(0);
// //       }

// //       logger.success("Succes");
// //       exit(0);
// //     } catch (e) {
// //       logger.info(e.toString());
// //       exit(0);
// //     }
// //   }
// }
