DD_API_KEY?=''
TARGET_OPTS?=

ifdef TARGET
	TARGET_OPTS = '-l $(TARGET)'
endif

setup:
	@ansible-playbook -i inventory/hosts -e 'target=restake password=$(PASSWORD) dd_api_key=$(DD_API_KEY) mnemonic=$(MNEMONIC) provider=$(PROVIDER)' $(TARGET_OPTS) setup.yml

update:
	@ansible-playbook -i inventory/hosts -e 'target=restake' $(TARGET_OPTS) update.yml
