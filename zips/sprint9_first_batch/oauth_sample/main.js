const { ipcMain } = require('electron');
ipcMain.handle('oauth-success', async (_e, token)=>{ /* link to backend */});
