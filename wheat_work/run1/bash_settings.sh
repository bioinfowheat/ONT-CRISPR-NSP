
# users
grenik
matmiq
nogmoh
elenik
elegom

# paths for installed software they can use 
# may need to change my :general settings

sudo chown :general -R /mnt/griffin/chrwhe/software/FastQC
sudo chown :general -R /mnt/griffin/chrwhe/software/samtools-1.10
sudo chown :general -R /mnt/griffin/chrwhe/software/minimap2


# can I also modify their bash so when the login they go directly to /mnt/griffin/user?

 
# #!/bin/bash
# for user in $1 ;do
#     echo '# paths for MsC course:' >> /home/$user/.bashrc
#     echo 'export PATH=$PATH:/data/programs/FastQC:/data/programs/samtools-1.9:/data/programs/cutadapt-1.8.3/bin:/data/programs/fastsimcoal26:/data/programs/plink1.9:/data/programs/bwa-mem2-2.2.1_x64-linux:/data/programs/gatk-4.6.2.0:/data/programs/admixture_linux-1.3.0' >> /home/$user/.bashrc
#     echo 'export JAVA_HOME=/opt/jdk17' >> /home/$user/.bashrc
#     echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/$user/.bashrc
# done

sudo ./bash_paths.sh aglsko

nano bash_paths.sh

 #!/bin/bash
for user in $1 ;do
    sudo echo 'export PATH=$PATH:/mnt/griffin/chrwhe/software/FastQC:/mnt/griffin/chrwhe/software/samtools-1.10:/mnt/griffin/chrwhe/software/minimap2' >> /home/$user/.bashrc
    sudo echo 'export JAVA_HOME=/opt/jdk17' >> /home/$user/.bashrc
    sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/$user/.bashrc
    sudo echo 'cd /mnt/griffin/$user' >> ~/.bashrc
done

chmod u+x bash_paths.sh
sudo ./bash_paths.sh

# for user in elegom grenik matmiq nogmoh elenik ;do
#     sudo echo 'export PATH=$PATH:/mnt/griffin/chrwhe/software/FastQC:/mnt/griffin/chrwhe/software/samtools-1.10:/mnt/griffin/chrwhe/software/minimap2' >> /home/$user/.bashrc
#     sudo echo 'export JAVA_HOME=/opt/jdk17' >> /home/$user/.bashrc
#     sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/$user/.bashrc
#     sudo echo 'cd /mnt/griffin/$user' >> ~/.bashrc
# done

for user in elegom grenik matmiq nogmoh elenik ;do
    sudo ./bash_paths.sh $user
done

# need to add new script
cd /mnt/griffin/chrwhe/ONT_testing
# /mnt/griffin/chrwhe/software/fastp

nano bash_paths_add_1.sh
#!/bin/bash
for user in $1 ;do
    echo '# additional paths for MsC course:' >> /home/$user/.bashrc
    echo 'export PATH=$PATH:/mnt/griffin/chrwhe/software/fastp' >> /home/$user/.bashrc
done

#
chmod u+x bash_paths_add_1.sh


for user in elegom grenik matmiq nogmoh elenik ;do
    sudo ./bash_paths_add_1.sh $user
done

# could export mamaba root to their own directory
echo "export MAMBA_ROOT_PREFIX=/mnt/griffin/$user//mamba_installs" >> ~/.bashrc
source ~/.bashrc
