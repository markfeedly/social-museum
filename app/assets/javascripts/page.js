jQuery(document).ready(function ($) {
    $('#tabs').tab();
    $(document).on("click", "#help-button",    help_dialog);
    $(document).on("click", "#comment-button", show_comment_box);
    $(document).on("click", "#collection-info-button", show_collection_item_info_box);
});

function show_comment_box(event) {
    event.preventDefault();
    $(event.target).hide();
    $("#comment-form").show();
}

function show_collection_item_info_box(event) {
    event.preventDefault();
    $("#page_collection_item_info").hide();
    $("#page_collection_item_edit_fields").show();
}

function help_dialog(event) {
    event.preventDefault();
    $("#dialog").dialog({
        position: {
            my: "right bottom",
            at: "right bottom",
            of: window
        },
        width: '600px'
    })
}



