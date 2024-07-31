ANSIBLE=ansible-playbook
ARGS=-i hosts

nothing:
	@echo "don't know what to make, sorry dave"
deps:
	${ANSIBLE} install-docker.yml ${ARGS}
	${ANSIBLE} build-docker-image.yml ${ARGS}

initialize-openvpn:
	${ANSIBLE} init-openvpn.yml ${ARGS}
	${ANSIBLE} init-openvpn-pki.yml ${ARGS}

run-openvpn:
	${ANSIBLE} run-openvpn-containers.yml ${ARGS}
