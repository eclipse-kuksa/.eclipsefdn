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
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('kuksa-actions') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa-android-sdk') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_linear_history: true,
          requires_status_checks: true,
          dismisses_stale_reviews : true,
          requires_strict_status_checks: true,
          require_last_push_approval: true,
        },
      ],
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
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Sources of the Kuksa website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "website",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          requires_linear_history: true,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_linear_history: true,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "staging",
            "website"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
