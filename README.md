    - name: deploy to server
      uses: saranraj3195/sparkout-deployment@v2
      env:
          DEPLOY_KEY: ${{ secrets.SERVER_SSH_KEY }}
          ARGS: "-avz --delete"
          SERVER_PORT: ${{ secrets.SERVER_PORT }}
          FOLDER: "src/*"
          SERVER_IP: ${{ secrets.SERVER_IP }}
          USERNAME: ${{ secrets.USERNAME }}
          SERVER_DESTINATION: ${{ secrets.SERVER_DESTINATION }}




ARGS: "--progress --delete -avzPh --exclude='.git/'  --exclude='bootstrap/cache/' --exclude='public/uploads/' --exclude='storage/' --exclude='.env' --exclude='.git*'  --exclude='.github'   --exclude='client.ovpn'    --exclude='readme.md' "
