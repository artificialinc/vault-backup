. .venv/bin/activate

export PYTHONIOENCODING=utf-8
export VAULT_ADDR=https://notvault.notartificial.xyz
export TOP_VAULT_PREFIX=/

vault login -method=github token=$GH_TOKEN

# python vault-dump.py

export GPG_KEY_ID=$(cat gpg_key_id.txt)
python vault-dump.py | gpg -e -r $GPG_KEY_ID > $(date +'%H-%M-%m-%d-%Y')-vault.dump.txt.gpg
