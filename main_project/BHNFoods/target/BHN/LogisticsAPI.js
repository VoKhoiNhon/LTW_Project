 fetch('http://140.238.54.136/api/auth/register', {
    method:"POST",
    mode: "cors",
    headers:{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        name:'Nhown',
        email:'khoinhon123@gmail.com',
        password:'12345678',
        password_confirmation:'12345678'
    })
}).then((response)=>{ return response.json()})