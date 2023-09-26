document.getElementById('boardQuantity').addEventListener('click', () => {


    getQtyList().then();



})

async function getQtyList() {
    try {
        let pageNo = 1;
        let qty = document.getElementById('boardQuantity').value;
        const resp = await fetch('/brd/pageList?pageNo=' + pageNo + '&qty=' + qty);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }

}