function makepublic(element)
{
	var picId = element.id;
	var action = 0;
	if(element.checked)
		action = 1;
	
	else
		action =0;
	
	$.getJSON('/index.cfm?event=makePaintingPublic&picId='+picId+'&action='+action,function(result){
		console.log(result);
	});
}