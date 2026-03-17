
# users
grenik
matmiq
nogmoh
elenik
elegom

# paths for installed software they can use 
# may need to change my :general settings

# can I also modify their bash so when the login they go directly to /mnt/griffin/user?

 
for user in elegom grenik matmiq nogmoh elenik ;do
    sudo echo 'export PATH=$PATH:/mnt/griffin/chrwhe/software/FastQC:/mnt/griffin/chrwhe/software/samtools-1.10:/mnt/griffin/chrwhe/software/minimap2' >> /home/$user/.bashrc
    sudo echo 'export JAVA_HOME=/opt/jdk17' >> /home/$user/.bashrc
    sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/$user/.bashrc
done

