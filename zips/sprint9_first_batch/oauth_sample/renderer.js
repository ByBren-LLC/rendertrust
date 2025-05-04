// pseudo-code Google sign-in integration
import { GoogleAuthProvider,getAuth,signInWithPopup } from 'firebase/auth';
export async function gLogin(){const auth=getAuth();const provider=new GoogleAuthProvider();const res=await signInWithPopup(auth,provider);const token=await res.user.getIdToken();window.ipcRenderer.invoke('oauth-success',token);} 
