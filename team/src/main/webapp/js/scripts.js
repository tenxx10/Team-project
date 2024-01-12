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

/* 자바 스크립트 코드 api */

var xhr = new XMLHttpRequest();
var baseUrl = 'http://apis.data.go.kr/1790387/vcninfo';
var endpoint = '/getCondVcnCd';
var serviceKey = '%2BTYJ4MaqolPJToji7Ytu6FNFTNByKa9Tohb0ML14DRwZjNOqftmxCB6WORYzjCNcegbAx40G9RSesITfoNENuQ%3D%3D';

var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + serviceKey;

var url = baseUrl + endpoint + queryParams;

xhr.open('GET', url);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        if (this.status == 200) {
            var jsonResponse = JSON.parse(this.responseText);
            // jsonResponse를 이용하여 데이터 처리
            console.log(jsonResponse);
        } else {
            console.error('API 호출 오류:', this.status);
        }
    }
};

xhr.send('');
