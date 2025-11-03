return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {'.git', {
        'main.py',
        'requirements.txt',
        'venv',
        'Pipfile',
        },
    },
    single_file_support = true,
}
