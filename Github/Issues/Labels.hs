module Github.Issues.Labels (
 label
,labelsOnRepo
,labelsOnIssue
,labelsOnMilestone
,module Github.Data
) where

import Github.Data
import Github.Private

labelsOnRepo :: String -> String -> IO (Either Error [IssueLabel])
labelsOnRepo user repoName = githubGet ["repos", user, repoName, "labels"]

labelsOnIssue :: String -> String -> Int ->  IO (Either Error [IssueLabel])
labelsOnIssue user repoName issueId =
  githubGet ["repos", user, repoName, "issues", show issueId, "labels"]

labelsOnMilestone :: String -> String -> Int ->  IO (Either Error [IssueLabel])
labelsOnMilestone user repoName milestoneId =
  githubGet ["repos", user, repoName, "milestones", show milestoneId, "labels"]

label :: String -> String -> String -> IO (Either Error IssueLabel)
label user repoName labelName =
  githubGet ["repos", user, repoName, "labels", labelName]
