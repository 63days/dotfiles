# cuda-11.0
wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda_11.0.2_450.51.05_linux.run
sudo sh cuda_11.0.2_450.51.05_linux.run

echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-11.0/lib64' >> ~/.zshrc
echo 'export PATH=${PATH}:/usr/local/cuda-11.0/bin' >> ~/.zshrc
source ~/.zshrc

    
