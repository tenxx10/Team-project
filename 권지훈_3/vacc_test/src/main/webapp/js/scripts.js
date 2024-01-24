/*!
* Start Bootstrap - Blog Home v5.0.9 (https://startbootstrap.com/template/blog-home)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-blog-home/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project



const express = require('express');
const app = express();
const port = 3000;

// 예방접종 대상 감염병 기준 목록 조회 API
app.get('/api/vaccinationDiseases', (req, res) => {
    // 여기에 데이터베이스에서 예방접종 대상 감염병 기준 목록을 조회하는 코드 작성
    const data = { key: 'vaccinationDiseases', name: '예방접종 대상 감염병 기준 목록' };
    res.json(data);
});

// 예방접종 대상 감염병 상세 정보 조회 API
app.get('/api/vaccinationDetails/:code', (req, res) => {
    // 여기에 데이터베이스에서 예방접종 대상 감염병 상세 정보를 조회하는 코드 작성
    const code = req.params.code;
    const data = { key: 'vaccinationDetails', code, details: '예방접종 대상 감염병 상세 정보' };
    res.json(data);
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});




    					
