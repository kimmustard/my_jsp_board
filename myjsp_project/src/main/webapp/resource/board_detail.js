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
        str += `<button type="button" data-cno="${result[i].cno}" data-writer="${result[i].writer}" class="cmtModBtn"> 수정 </button>`;
        str += `<button type="button" data-cno="${result[i].cno}" class="cmtDelBtn"> 삭제 </button>`;
        str += `</div> </div>`
        div.innerHTML += str;
    }

}


//수정, 삭제 수행. 이벤트리스너를 통해 클릭으로 DOM 정보 가져오기
document.addEventListener('click', (e) => {
    console.log(e.target);

    if (e.target.classList.contains('cmtModBtn')) {
        let cno = e.target.dataset.cno;
        let div = e.target.closest('div');  //가까운 div찾기, cmtText는 데이터가 크기때문에 div를 찾아서 열고, cmttext를 열어봐야한다.
        let cmtText = div.querySelector('#cmtText').value;
        let writer = e.target.dataset.writer;

        console.log(cno);
        console.log(div);
        console.log(cmtText);
        console.log(writer);
        //수정 객체 서버로 보내자 
        updateCommentFromServer(cno, writer, cmtText).then(result => {
            if (result > 0) {
                alert('수정 성공!');
                printCommentList(bnoVal);
            } else {
                alert('수정 실패');
            }
        })

    }

    //삭제 객체 서버로 보내기

    if (e.target.classList.contains('cmtDelBtn')) {
        let cno = e.target.dataset.cno;
        console.log(cno);

        //삭제 함수로 보내기
        removeCommentFromServer(cno).then(result => {
            if (result > 0) {
                alert('삭제 성공');
                printCommentList(bnoVal);
            } else {
                alert('삭제 실패');
            }
        })

    }



})


//수정 함수

async function updateCommentFromServer(cnoVal, cmtWriter, cmtText) {
    try {
        const url = '/cmt/modify';
        const config = {
            method: 'post',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify({ cno: cnoVal, writer: cmtWriter, content: cmtText })
        }

        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (error) {
        console.log(error);
    }
}

async function removeCommentFromServer(cno) {
    try {

        const resp = await fetch('/cmt/remove/' + cno); //remove는 comment 넘버만 있으면 삭제가능해서 객체를 보낼 필요가 없다.
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
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