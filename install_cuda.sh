# cuda-11.2
wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run
sudo sh cuda_11.2.0_460.27.04_linux.run

echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-11.2/lib64' >> ~/.zshrc
echo 'export PATH=${PATH}:/usr/local/cuda-11.2/bin' >> ~/.zshrc
source ~/.zshrc

    
