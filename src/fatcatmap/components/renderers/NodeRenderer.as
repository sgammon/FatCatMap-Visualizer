package fatcatmap.components.renderers
{	
	import fatcatmap.nodes.CandidateNode;
	import fatcatmap.nodes.ContributorNode;
	
	import mx.core.UIComponent;
	
	public class NodeRenderer
	{
		public function NodeRenderer()
		{
			super();
		}
		
		public static function Render(data:Object):UIComponent
		{
			var nodeType:String = data["kind"];
			
			if (nodeType == 'Candidate')
			{
				
				var candidate:CandidateNode = new CandidateNode();
				
				candidate.objectData = data;
				
				candidate.display_text = data['display_text'];
				
				var candidate_fill_colors:Array = [0x94BBBB, 0x67A1A8];
				var candidate_fill_alphas:Array = [1.0, 1.0];
				
				if (data['is_root'] == 'True')
				{
					candidate.fontWeight = 'bold';
				}
				
				candidate.setStyle('fillColors',candidate_fill_colors);
				candidate.setStyle('fillAlphas',candidate_fill_alphas);
				candidate.setStyle('cornerRadius',4);
				
				return candidate;
			}
			else if (nodeType == 'Contributor')
			{
				
				var contributor:ContributorNode = new ContributorNode();
				
				contributor.objectData = data;
				
				contributor.display_text = data['display_text'];
				
				var contributor_fill_colors:Array = [0xA9C6AD, 0x589372];
				var contributor_fill_alphas:Array = [1.0, 1.0];
				
				if (data['is_root'] == 'True')
				{
					contributor.fontWeight = 'bold';
				}
				
				contributor.setStyle('fillColors',contributor_fill_colors);
				contributor.setStyle('fillAlphas',contributor_fill_alphas);
				contributor.setStyle('cornerRadius',4);
				
				return contributor;
			}
			return null;
		}
	}
}