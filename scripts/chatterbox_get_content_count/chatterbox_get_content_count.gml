/// Returns the total number of content strings in the given chatterbox
///
/// @param chatterbox

function chatterbox_get_content_count(_chatterbox)
{
    if (!is_chatterbox(_chatterbox)) return undefined;
    return array_length(_chatterbox.content);
}