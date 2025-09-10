import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_folders_state.g.dart';

@Riverpod(keepAlive: true)
class ProjectFoldersController extends _$ProjectFoldersController {
  @override
  List<String> build() => [];

  Future<void> init() async {
    final downloadFolder = (await getDownloadsDirectory())!.path;
    final developerFolder = await ref.read(fileSystemManagerProvider).getDeveloperFolder();
    state = [
      downloadFolder,
      developerFolder,
    ];
  }

  Future<void> add(String path) async {
    if (!state.contains(path)) {
      state = [...state, path];
    }
  }

  Future<void> remove(String path) async {
    if (state.contains(path)) {
      final newState = List<String>.of(state)..remove(path);
      state = newState;
    }
  }
}
