from QtToolsFish import conans_tools
from QtToolsFish.Conans import QtConanFile

package_name = "UiBase"
package_version = "develop"

package_user_channel = "fish/stable"


class ConanConfig(QtConanFile):
    name = package_name
    version = package_version

    git_url = "git@gitlab.xiaoheiban.cn:windows/talcloud_khaos_uibase.git"
    git_branch = "develop/conan"

    description = "Windows UiBase Library"

    exports_sources = "*"

    def source(self):
        conans_tools.move_dir_files_to_folder(self.get_library_name())
        super(ConanConfig, self).source()


if __name__ == '__main__':
    conans_tools.remove_cache(package_version=f"{package_name}/{package_version}", user_channel=package_user_channel)
    conans_tools.create(user_channel=package_user_channel)
    conans_tools.upload(package_version=f"{package_name}/{package_version}", user_channel=package_user_channel)
