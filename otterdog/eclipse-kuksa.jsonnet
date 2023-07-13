local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-kuksa') {
  settings+: {
    default_repository_permission: "none",
    description: "",
    name: "Eclipse Kuksa",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('kuksa-actions') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa-databroker') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa-viss') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa-website') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
    },
  ],
}
