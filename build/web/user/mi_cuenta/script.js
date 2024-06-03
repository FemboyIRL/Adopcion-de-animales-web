function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

document.getElementById('fileInput').addEventListener('change', function () {
    document.getElementById('imageForm').submit();
});
