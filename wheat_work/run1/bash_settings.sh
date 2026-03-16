
# working paths for all commands in tutorial
export PATH=$PATH:/data/programs/FastQC:/data/programs/samtools-1.9:/data/programs/cutadapt-1.8.3/bin:/data/programs/fastsimcoal26:/data/programs/plink1.9:/data/programs/bwa-mem2-2.2.1_x64-linux:/data/programs/gatk-4.6.2.0:/data/programs/admixture_linux-1.3.0
export JAVA_HOME=/opt/jdk17
export PATH=$JAVA_HOME/bin:$PATH




for user in marcha soferr elegom ellkon faiony anirou nikwer ulljoh marric aglsko samwal larlit maffer tester vikove sofnyb ;do
    sudo echo 'export PATH=$PATH:/data/programs/FastQC:/data/programs/samtools-1.9:/data/programs/cutadapt-1.8.3/bin:/data/programs/fastsimcoal26:/data/programs/plink1.9:/data/programs/bwa-mem2-2.2.1_x64-linux:/data/programs/gatk-4.6.2.0:/data/programs/admixture_linux-1.3.0' >> /home/$user/.bashrc
    sudo echo 'export JAVA_HOME=/opt/jdk17' >> /home/$user/.bashrc
    sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/$user/.bashrc
done

