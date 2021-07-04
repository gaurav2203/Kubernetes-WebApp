# Kubernetes-WebApp
### After running the script we need to escalate privileges of apache user. 
Step 1: vim /etc/sudoers.<br />
Step 2: Append the following line:<br />
        `apache  ALL=(ALL)   NOPASSWD:ALL`<br />
        This will give apache user the power of root when sudo word is used before the command.<br />
Step 3: Save the file:<br />
        `esc > :qw!`<br />
        We need to add ! because it is read only file.<br />
  
### In this we are using only Kubernetes master to perform the tasks. Therefore, we need to untaint it so that we can launch the resources on top of it. <br />
`kubectl taint node mymasternode node-role.kubernetes.io/master:NoSchedule-`
<br />
<br />
That's all!
