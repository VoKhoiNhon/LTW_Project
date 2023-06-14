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
 fetch('http://140.238.54.136/api/province', {
     method:"GET",
     mode: "cors",
     headers:{
         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODIyMzU0MjAsImV4cCI6MTY4MjIzNjAyMCwibmJmIjoxNjgyMjM1NDIwLCJqdGkiOiI4ZkFWMzNPTnJXMXdrOHdPIiwic3ViIjoiMjdiYTM1NjZmMDJhNDUyMjkzNjE4OGI5NDQwZmNhMjAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4yQvbNCCYRRzYg_qruN-MFqKBC2OudOhuG1cJyjJJag'
     }
 }).then((response)=>{ return response.json()}).then((response)=>{console.log(response)});

 fetch('http://140.238.54.136/api/auth/login', {
     method:"POST",
     mode: "cors",
     headers:{
         'Content-Type': 'application/json'
     },
     body: JSON.stringify({
         email:'khoinhon123@gmail.com',
         password:'12345678'

     })}).then((response)=>{ return response.json()}).then((response)=>{console.log(response.access_token)});
 fetch('http://140.238.54.136/api/district?provinceID=269', {
     method:"GET",
     mode: "cors",
     headers:{
         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODIyMzU0MjAsImV4cCI6MTY4MjIzNjAyMCwibmJmIjoxNjgyMjM1NDIwLCJqdGkiOiI4ZkFWMzNPTnJXMXdrOHdPIiwic3ViIjoiMjdiYTM1NjZmMDJhNDUyMjkzNjE4OGI5NDQwZmNhMjAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4yQvbNCCYRRzYg_qruN-MFqKBC2OudOhuG1cJyjJJag'
     }
 }).then((response)=>{ return response.json()}).then((response)=>{console.log(response.original.data)});