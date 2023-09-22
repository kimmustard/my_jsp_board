//댓글 객체 서블릿으로 전달
document.getElementById('cmtAddBtn').addEventListener('click', () => {
    const cmtText = document.getElementById('cmtText').value;
    console.log(cmtText);
    if (cmtText == null || cmtText == "") {
        alert('댓글을 입력해주세요.');
        return false;
    } else {
        //댓글 데이터 담을 객체
        let cmtData = {
            bno: bnoVal,
            writer: document.getElementById('cmtWriter').value,
            content: cmtText
        };

        postCommentToServer(cmtData).then(result => {
            if (result > 0) {
                alert("댓글 등록 성공!");
            } else {
                alert("댓글 등록 실패!");
            }
            printCommentList(cmtData.bno);
        })


    }
})


//댓글 폼데이터 => 서버로 보낼때
async function postCommentToServer(cmtData) {
    try {
        const url = "/cmt/post";
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)   //자바스크립트의 값을 JSON으로 변환
        }
        const resp = await fetch(url, config);
        const result = await resp.text(); // 0 or 1 리턴
        return result;
    } catch (error) {
        console.log(error);
    }
}

//댓글 리스트 화면에 출력
function spreadCommentList(result) {
    console.log(result);


    let div = document.getElementById('cmtContainerExample');
    div.innerHTML = "";
    for (let i = 0; i < result.length; i++) {
        let str = `<div>`;
        str += `<h4 id="cmtHeader${i}">`;
        str += ` 글번호 : ${result[i].cno}`;
        str += ` 작성자 : ${result[i].writer}`;
        str += ` 작성날짜 : ${result[i].regdate}`;
        str += ` 추천수 : ${result[i].cmt_recommend}`;
        str += `</h4>`;
        str += `<div id="cmtBody">`;
        str += `<input type="text" id="cmtText" value="${result[i].content}">`;
        str += `<button type="button"> 수정 </button>`;
        str += `<button type="button"> 삭제 </button>`;
        str += `</div> </div>`
        div.innerHTML += str;
    }

}






//리스트 요청 -> 서버로 보낼때
async function getCommentListFromServer(bno) {
    try {
        const resp = await fetch('/cmt/list/' + bno);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//리스트 요청 -> 서버 -> 결과 받고 js (댓글) 출력
function printCommentList(bno) {
    getCommentListFromServer(bno).then(result => {
        console.log(result);
        if (result.length > 0) {
            spreadCommentList(result);
        } else {
            let div = document.getElementById('cmtContainerExample')
            div.innerHTML = `댓글이 없습니다.`;
        }
    })
}