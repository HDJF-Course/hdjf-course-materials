echo id,user,user_url,time,url,text,a_id,a_user,a_user_url,a_time,a_url,a_text,att_type,att_url,media_url,ext_url,ext_text,comment_count,toplevel_comment_count,reaction_count,share_count,reactors,reaction_type0,reaction_count0,reaction_type1,reaction_count1,reaction_type2,reaction_count2,reaction_type3,reaction_count3,,reaction_type4,reaction_count4,reaction_type5,reaction_count5,,reaction_type6,reaction_count6,,reaction_type7,reaction_count7
jq -r -s '
	map(.id),
	map(.comet_sections.context_layout.story.comet_sections.title.story.actors[0].name // "-"),
	map(.comet_sections.context_layout.story.comet_sections.title.story.actors[0].url // "-"),

	map(.comet_sections.context_layout.story.comet_sections.metadata[0].story.creation_time // "-"),
	map(.comet_sections.context_layout.story.comet_sections.metadata[0].story.url // "-"),
	map(.comet_sections.content.story.comet_sections.message.story.message.text // "-"),

	map(.attached_story.id // "-"),
	map(.attached_story.comet_sections.context_layout.story.comet_sections.title.story.actors[0].name // "-"),
	map(.attached_story.comet_sections.context_layout.story.comet_sections.title.story.actors[0].url // "-"),

	map(.comet_sections.content.story.comet_sections.attached_story.story.attached_story.comet_sections.attached_story_layout.story.comet_sections.metadata[0].story.creation_time),
	map(.comet_sections.content.story.comet_sections.attached_story.story.attached_story.comet_sections.attached_story_layout.story.comet_sections.metadata[0].story.url // "-"),
	map(.comet_sections.content.story.comet_sections.attached_story.story.attached_story.comet_sections.attached_story_layout.story.comet_sections.message.story.message.text // "-"),

	map(.comet_sections.content.story.attachments[].style_type_renderer.__typename // "-"),
	map(.comet_sections.content.story.attachments[].style_type_renderer.attachment.url // "-"),
	map(.comet_sections.content.story.attachments[].style_type_renderer.attachment.media.url // "-"),
	map(.comet_sections.content.story.attachments[].style_type_renderer.attachment.story_attachment_link_renderer.attachment.web_link.url // "-"),
	map(.comet_sections.content.story.attachments[].style_type_renderer.attachment.title_with_entities.text // "-"),

	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comment_count.total_count // 0),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.toplevel_comment_count.count // 0),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.reaction_count.count // 0),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.share_count.count // 0),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.reactors.count // 0),
	
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[0].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[0].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[1].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[1].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[2].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[2].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[3].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[3].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[4].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[4].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[5].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[5].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[6].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[6].reaction_count),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[7].node.reaction_type),
	map(.comet_sections.feedback.story.feedback_context.feedback_target_with_context.comet_ufi_summary_and_actions_renderer.feedback.top_reactions.edges[7].reaction_count)

	| @csv' \
	| csvtool transpose -
