function mostrarOtroMotivo() {
    var motivoSelect = document.getElementById("motivo");
    var otroMotivoLabel = document.getElementById("otroMotivoLabel");
    var otroMotivoTextarea = document.getElementById("otroMotivo");

    if (motivoSelect.value === "otro") {
        otroMotivoLabel.style.display = "block";
        otroMotivoTextarea.style.display = "block";
    } else {
        otroMotivoLabel.style.display = "none";
        otroMotivoTextarea.style.display = "none";
    }
}
