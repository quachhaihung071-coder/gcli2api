name: Sync to Hugging Face hub

on:
  push:
    branches:
      - main  # 或者你的主分支名

jobs:
  sync-to-hub:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
          lfs: true
      - name: Push to hub
        env:
          HF_TOKEN: ${{ secrets.HF_TOKEN }}
        run: |
          git remote add space https://quachhaihun:$HF_TOKEN@huggingface.co/spaces/quachhaihun/geminiopenai
          git push --force space main
