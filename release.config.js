// release.config.js
module.exports = {
    branches: ["main", "ci"],
    plugins: [
        "@semantic-release/commit-analyzer",
        "@semantic-release/release-notes-generator",
        ["@semantic-release/gitlab", {
            "assets": [
                { "path": "build/ow1em.txt", "label": "Overwatch 1 Emulator" },
                { "path": "build/ow1pp.txt", "label": "Overwatch 1++" },
            ]
        }], 
        ["semantic-release-discord-bot", {
            "notifications": [{
                    "branch": "main"
                }
            ]
        }]
    ],
};