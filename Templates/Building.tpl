<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       Building.tpl                                                ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2025. All rights reserved.                ##
##                                                                             ##
#################################################################################
$building->loadBuilding();
?>
<?php if($building->NewBuilding){ ?>
<table cellpadding="1" cellspacing="1" id="building_contract">
    <thead><tr>
    <th colspan="4"><?php echo BUILDING_UPGRADING;?>
			<?php
            
            if($session->gold >= 2) {
            ?> 
            	<a href="?buildingFinish=1" onclick="return confirm('Finish all construction and research orders in this village immediately for 2 Gold?');" title="Finish all construction and research orders in this village immediately for 2 Gold?"><img class="clock" alt="Finish all construction and research orders in this village immediately for 2 Gold?" src="img/x.gif"/></a>
			<?php 
            }
            ?>
            </th>
		</tr></thead>
		<tbody>
        <?php 
        foreach($building->buildArray as $jobs) {
		if($jobs['master'] == 0){
        	echo "<tr><td class=\"ico\"><a href=\"?d=".$jobs['id']."&a=0&c=$session->checker\">";
            echo "<img src=\"img/x.gif\" class=\"del\" title=\"cancel\" alt=\"cancel\" /></a></td><td>";
			echo Building::procResType($jobs['type'])." (Level ".$jobs['level'].")";

			if($jobs['loopcon'] == 1) echo " (waiting loop)";

            echo "</td><td>in <span id=\"timer".++$session->timer."\">";
            echo $generator->getTimeFormat($jobs['timestamp']-time());
            echo "</span> hrs.</td>";
            echo "<td>done at ".date('H:i', $jobs['timestamp'])."</td></tr>";
		}else{
        	echo "<tr><td class=\"ico\"><a href=\"?d=".$jobs['id']."&a=0&c=$session->checker\">";
            echo "<img src=\"img/x.gif\" class=\"del\" title=\"cancel\" alt=\"cancel\" /></a></td><td>";
            echo Building::procResType($jobs['type'])."<span class=\"none\"> (Level ".$jobs['level'].")</span>";
			}
      	}
        ?>
            </tbody>
	</table>
	<script type="text/javascript">var bld=[{"stufe":1,"gid":"1","aid":"3"}]</script>
<?php }else{
        $the_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        header('Location: '. $the_link);
		exit;
} ?>

