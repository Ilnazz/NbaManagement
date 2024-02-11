using System.Collections.Generic;
using System.Linq;

namespace NbaManagement.Database
{
    public partial class Team
    {
        public IEnumerable<Player> Players => Team_Player.Select(teamPlayer => teamPlayer.Player);

        public IEnumerable<Matchup> AwayMatchups => Matchups;

        public IEnumerable<Matchup> HomeMatchups => Matchups1;
    }
}