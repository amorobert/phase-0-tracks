# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
* Version control allows a developer to have multiple version of the same code base. It allows one to test changes to code without breaking the main program.
* What is a branch and why would you use one?
* A branch allows you to modify and add features to a code without running the risk of breaking the main code base. It allows one or multiple coders to work on feature individually before adding them to the main code base. This allows multiple people to work simultaneously, stepping on each others toes minimally. It also allows an individual to make sure a feature is fully working before merging to the master track.
* What is a commit? What makes a good commit message?
* A commit is recording a snapshot of the current changes made to a branch. It allows one to revert changes back if something goes wrong. Good commit messages are to the point and specific about what changes have been made.
* What is a merge conflict?
A merge conflict is when the same code has been modified in two different ways and is attempting to be merged. Git doesn't know which modifcation that that developer would like to use, thus creating a conflict.