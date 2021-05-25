cd /Users/user/wow-type
docker run --rm --name container-wow-type -d -p 8888:8888 \
-v /Users/user/wow-type/host_ws:/docker_ws -w /docker_ws \
image-wow-type jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root \
--NotebookApp.token=''
