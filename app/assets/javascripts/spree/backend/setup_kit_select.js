var set_kit_select = function(selector){
    if ($(selector).length > 0) {
        $(selector).select2({
            placeholder: Spree.translations.kit_placeholder,
            multiple: true,
            maximumSelectionSize: 1,
            initSelection: function (element, callback) {
                var url = Spree.url("/admin/kits/search", {
                    ids: element.val(),
                    token: Spree.api_key
                });
                return $.getJSON(url, null, function (data) {
                    return callback(data['kits']);
                });
            },
            ajax: {
                url: "/admin/kits/search",
                datatype: 'json',
                data: function (term, page) {
                    return {

                        q: {
                            name_cont: term
                        },
                        token: Spree.api_key
                    };
                },
                results: function (data, page) {
                    console.log (data);
                    return {
                        results: data['results']
                    };
                }
            },
            formatResult: function (kit) {
                return kit.name;
            },
            formatSelection: function (kit) {
                return kit.name;
            }
        });
    }
}

$(document).ready(function () {
    set_kit_select('#kit_id')
});
