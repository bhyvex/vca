{*Load number modifier*}
{0|number}
<div class="col-sm-6">
	<h2 class="sub-header">
		{$Title}
		{if {$userRank>0}} 
			<a href="#" onclick="popupVpsAdd({$serverCurrent})" title="{'Create a new Vps'|gettext}">
				<button class="btn btn-success" type="button">
					<span class="glyphicon glyphicon-plus"></span>
				</button>
			</a>
		{/if}
	</h2>
</div>

<div class="col-sm-6">
	<div id="vpsAll" role="alert" class="alert alert-info center">
		<a href="#" title="{'Start'|gettext}" onclick="popupVpsStartAll();">
			<button class="btn btn-success" type="button">
				<span class="glyphicon glyphicon-play"></span>
			</button>
		</a>
		<a href="#" title="{'Stop'|gettext}" onclick="popupVpsStopAll();">
			<button class="btn btn-danger" type="button">
				<span class="glyphicon glyphicon-stop"></span>
			</button>
		</a>
		<a href="#" title="{'Restart'|gettext}" onclick="popupVpsRestartAll();">
			<button class="btn btn-warning" type="button">
				<span class="glyphicon glyphicon-repeat"></span>
			</button>
		</a>
	</div>
</div>

<div class="col-sm-12">
{if isset($vpsList) }
	<div class="table-responsive"><br/>
		<table class="table table-striped">
			<thead>
				<tr>
					<th><input type="checkbox" id="vps_list" /></th>
					<th></th>
					<th>{'Name'|gettext}</th>
					<th>{'IPv4'|gettext}</th>
					<th>{'Memory'|gettext}</th>
					<th>{'Disk'|gettext}</th>
					<th>{'OS Template'|gettext}</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			{foreach from=$vpsList item=server}
				<tr>
					<td><input type="checkbox" class="vps_list" name="vps_list[]" value="{$server->id}"/></td>
					<td>
						{if {$server->nproc} == 0}
							<span class="glyphicon glyphicon-record offline" title="{'Offline'|gettext}"></span>
						{else}
							<span class="glyphicon glyphicon-record online" title="{'Online'|gettext}"></span>
						{/if}
					</td>
					<td><a href="/vps/{$server->id}" title="{'Information'|gettext}">{$server->name}</a></td>
					<td>{$server->ipv4}</td>
					<td>{$server->ramCurrent|numberRamSizeCurrent}/{$server->ram|numberRamSize}</td>
					<td>{$server->diskspaceCurrent|numberDiskSpace}/{$server->disk|numberDiskSpace}</td>
					<td>{$server->ostemplate}</td>
					<td>
						<a href="/vps/{$server->id}" title="{'Information'|gettext}">
							<button class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-align-justify"></span>
							</button>
						</a>
						
						<a href="#" title="{'Start'|gettext}" onclick="popupVpsStart({$server->id});">
							<button class="btn btn-success" type="button">
								<span class="glyphicon glyphicon-play"></span>
							</button>
						</a>
						
						<a href="#" title="{'Stop'|gettext}" onclick="popupVpsStop({$server->id});">
							<button class="btn btn-danger" type="button">
								<span class="glyphicon glyphicon-stop"></span>
							</button>
						</a>
						
						<a href="#" title="{'Restart'|gettext}" onclick="popupVpsRestart({$server->id});">
							<button class="btn btn-warning" type="button">
								<span class="glyphicon glyphicon-repeat"></span>
							</button>
						</a>
						
						{if $userRank > 0}
							{if $server->protected == 0}
								<a href="#" title="{'Delete'|gettext}" onclick="popupVpsDelete({$server->id});">
									<button class="btn btn-danger" type="button">
									  <span class="glyphicon glyphicon-remove"></span>
									</button>
								</a>
							{else}
								<button type="button" class="btn btn-invisible">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
							{/if}
						{/if}
				  </td>
				</tr>
			{/foreach}
			</tbody>
		</table>
	</div>
{/if}
</div>

<script type="text/javascript">

$(".vps_list").change(function () {
	if($(this).is(':checked')) {
		$("#vpsAll").show();
	}
	else {
		$("#vps_list").prop('checked', false);
		check_vps_list();
	}
});

$("#vps_list").change(function () {
	if($("#vps_list").is(':checked')) {
		$(".vps_list").prop('checked', true);
		$("#vpsAll").show();
	}
	else {
		$(".vps_list").prop('checked', false);
		$("#vpsAll").hide();
	}
});

$(function() {
	$("input.vps_list:checked").each(function() {
		$(this).prop('checked', false);
	});
});

</script>
