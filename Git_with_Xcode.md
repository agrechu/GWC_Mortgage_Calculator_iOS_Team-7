# Git Commands with Xcode


## Create your own branch


Create your own branch: You should NEVER work directly off of the main branch or push your changes directly to the main branch. This can lead to merge conflicts and make it extremely messy to merge your code with your teammates. You always want to create a branch of your own and then later pull your code changes into the main branch. To create your own branch from Xcode, click the “main” drop down at the top of the screen. Click on the three dots to see options, and select the “New branch from “main” option
![image](https://github.com/user-attachments/assets/6708e2ee-1d96-4d59-af96-1a95c04e70b5)

Name your branch your team number followed by your last name. For example: Team3/Campbell. Click “Create”. You should now see the “main” dropdown now says your new branch name instead.
![image](https://github.com/user-attachments/assets/22345988-4ec2-4229-a34c-3473fe165d0e)

## Pushing your code

1. After you’ve made code changes that you are ready to share with your team, you’ll first need to commit your changes. By committing, you are confirming that you have tested your changes and are confident enough in them to share them with your team. In the top navigation bar, click the “Source Control” tab and select “Commit…”.
![image](https://github.com/user-attachments/assets/aadc17c2-6df1-42b2-b78f-5c8a82ade567)

2. Select only the checkbox next to the files that you wish to commit, i.e. only the files that you made changes to. NOTE: you do not need to commit the .DS_STORE, or the xcuserdata files. These are auto-generated caching files.
<img width="400" alt="image" src="https://github.com/user-attachments/assets/081a7718-1f16-41bd-880c-9bc0ad4fe37e">


3. Add a commit message describing what changes you’ve made. Click “Commit _ File” to complete commit.
![image](https://github.com/user-attachments/assets/960495ad-03cf-432d-acb6-920a2a7b0364)

4. Return back to the “Source Control” tab, and select “Push”. Make sure the dropdown has your branch selected, and click “Push”


5. If this is your first time pushing code for this project, you may be asked to authenticate yourself. If you see a screen pop up asking for you to enter in your username and password, enter in the username and password you created for your GitHub account. You may then see a screen asking you to enter a Personal Access Token. Follow these steps to create your personal access token . Make sure you select the scope sets specified below when created your token. Copy and save your personal access token on your computer (NOTE: YOU WILL NOT BE ABLE TO VIEW THE TOKEN AGAIN SO MAKE SURE YOU SAVE IT!).
![image](https://github.com/user-attachments/assets/592160cd-2dda-4ca9-8544-0b3179c14320)



6. Enter in your account email and paste the personal access token. Click “Sign In” and you should now see the push be completed!
![image](https://github.com/user-attachments/assets/04f2a74f-8317-4530-87b7-bbb7d36e7721)








## Opening a Pull Request


1. Pull requests are used to review your teams code before merging their changes into the main branch. To open a merge request after you pushed your changes to your branch, navigate to your project on GitHub. You should see a prompt that has the option “Compare & pull request”. Click the button. 
![image](https://github.com/user-attachments/assets/a11ff375-a803-4cda-8335-c7b11409f637)


2. You’ll see a pull request is auto-completed for you. The base branch should be “main” and the “compare” branch should be your branch. If you’d like to add more context for your team, add comments in the description. Once you’re done, click “Create Pull Request”.

## Reviewing Pull Requests 

 Once your teammate has opened a PR, it is up to your team to properly review and once approved merge the PR into the main branch. To review the PR, on your projects GitHub page navigate to the “Pull Requests” tab. Click on the pull request you want to review. 



Click on the “Files Changed” Tab, and after reviewing the changes, click on the “Review Changes” button. You’ll see the option to “Comment”, “Approve”, or Request a change”. If there are updates you want your teammate to make -> choose “Request a change”. If you approve of the PR, -> choose “Approve”.

![image](https://github.com/user-attachments/assets/2e63be76-4063-40b4-9b18-07d0e5c597da)









Once the PR has been approved, work with the Lead Project Manager to get the PR merged. 




## Pulling latest changes 


After your teammate’s PRs are merged, you are going to want to pull their changes into your branch on your local. In Xcode, click the “Source Control” tab again, and select “Pull…”. Change the branch you are pulling from to be the “main” branch. Click Pull.

![image](https://github.com/user-attachments/assets/c5cf2c3a-c82b-4e17-8da8-58ad814ddbb7)





If you currently have any not committed changes on your local, please commit your changes first before trying to pull. 


If you face merge conflicts, please follow the following tutorial.
