import {Socket} from "phoenix"
let socket = new Socket("/socket", {params: {token: window.userToken}})
//var socket = new Phoenix.Socket("/ws")
socket.connect()
let channel = socket.channel("comments:1", {})
channel.join()
.receive("ok", resp => { console.log("Bechir Joined sucessfully");})
.receive("error", resp => { console.log("Unable to Join ");})

document.querySelector('button').addEventListener('click', function(){
  channel.push('comment:hello', {hi: 'there!'})
});
export default socket
