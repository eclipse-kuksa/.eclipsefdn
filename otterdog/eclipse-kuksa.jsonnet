local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

# Default branch protection rule for KUKSA repositories
# As a general rule all repos shall have branch protection for main but not necessarily from start.
# It may for example be relevant to not have branch protection during the migration phase from old
# eclipse/kuksa.* repos to repos in this orga, to be able to "redo" the migration if needed
# Repositories may use other branch protection rules if considered needed

local kuksa_default_branch_protection_rule(pattern) =
  orgs.newBranchProtectionRule(pattern) {
        dismisses_stale_reviews: true,
        require_last_push_approval: true,
        required_approving_review_count: 1,
        requires_strict_status_checks: true,
  };


orgs.newOrg('automotive.kuksa', 'eclipse-kuksa') {
  settings+: {
    description: "",
    name: "Eclipse Kuksa",
    packages_containers_internal: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('CRATES_API_TOKEN') {
     value: "pass:bots/automotive.kuksa/crates.io/api-token",
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/automotive.kuksa/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/automotive.kuksa/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('ORG_GPG_KEY_ID') {
      value: "pass:bots/automotive.kuksa/gpg/subkey_id",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "pass:bots/automotive.kuksa/oss.sonatype.org/gh-token-password",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "pass:bots/automotive.kuksa/oss.sonatype.org/gh-token-username",
    },
    orgs.newOrgSecret('QUAY_IO_TOKEN') {
      value: "pass:bots/automotive.kuksa/quay.io/robot-token",
    },
    orgs.newOrgSecret('QUAY_IO_USERNAME') {
      value: "pass:bots/automotive.kuksa/quay.io/robot-username",
    },
    orgs.newOrgSecret('KEYSTORE_RELEASE') {
      value: "pass:bots/automotive.kuksa/android/keystore-release",
    },
    orgs.newOrgSecret('KEYSTORE_DEBUG') {
      value: "pass:bots/automotive.kuksa/android/keystore-debug",
    },
    orgs.newOrgSecret('SIGNING_STORE_PASSWORD') {
      value: "pass:bots/automotive.kuksa/android/store-password",
    },
    orgs.newOrgSecret('SIGNING_KEY_PASSWORD') {
      value: "pass:bots/automotive.kuksa/android/key-password",
    },
    orgs.newOrgSecret('SIGNING_KEY_ALIAS') {
      value: "pass:bots/automotive.kuksa/android/alias",
    },
    orgs.newOrgSecret('ECLIPSE_GITLAB_API_TOKEN') {
      value: "pass:bots/automotive.kuksa/gitlab.eclipse.org/api-token",
    },
    orgs.newOrgSecret('CODECOV_TOKEN') {
      value: "pass:bots/automotive.kuksa/codecov.io/codecov-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('kuksa-actions') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Reusable Github actions and workflows used in the Eclipse KUKSA project",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa.apps') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa.cloud') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa.ide') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },    
    orgs.newRepo('kuksa.invehicle') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa.val.feeders') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets+: [
        orgs.newRepoSecret('PUSH_CONTAINER_TOKEN') {
          value: "********",
        }
      ],
    },    
    orgs.newRepo('kuksa.val.services') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Kuksa Apps repo",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('kuksa-android-sdk') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-databroker') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "A modern in-vehicle VSS (Vehicle Signal Specification) server written in RUST",
      homepage: "https://eclipse-kuksa.github.io/kuksa-website/",
      topics: [
        "agl", 
        "automotive",
        "eclipse",
        "eclipse-sdv",
        "kuksa",
        "sdv",
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-hardware') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-viss') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Sources of the Kuksa website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "website",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('master')
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
    orgs.newRepo('kuksa-common') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Common files and tools for different KUKSA components",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-python-sdk') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "The Python SDK for Eclipse KUKSA",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      environments: [
        orgs.newEnvironment('pypi'),
      ],
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-android-companion') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-can-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-dds-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-gps-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-csv-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "An data and actuation provider for Eclipse KUKSA based on CSV files. Good for simple mocking and replaying data.",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-someip-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-mock-provider') {
      description: "Python-based mock provider intended for testing",
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-incubation') {
      description: "Proof-of-Concepts, Demonstrators and other contributions",
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      dependabot_security_updates_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-perf') {
      description: "KUKSA performance tests",
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-java-sdk') {
      description: "The Java SDK for Eclipse KUKSA",
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-proto') {
      description: "Protobuf definitions for Eclipse KUKSA",
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
    orgs.newRepo('kuksa-rust-sdk') {
      description: "The Rust SDK for the Eclipse KUKSA",
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        kuksa_default_branch_protection_rule('main')
      ],
    },
  ],
}
