using NbaManagement.Database;
using NbaManagement.ViewModels.Base;
using System.Collections.Generic;

namespace NbaManagement.ViewModels
{
    public class TeamDetailViewModel : TitledViewModel
    {
        public IEnumerable<Player> PowerForwardPlayers { get; }

        public IEnumerable<Player> ShootingGuardPlayers { get; }

        public IEnumerable<Player> CenterPlayers { get; }

        public IEnumerable<Player> SmallForwardPlayers { get; }

        public IEnumerable<Player> PointGuardPlayers { get; }

        private readonly Team _team;

        public TeamDetailViewModel(Team team)
        {
            _team = team;
            
            Title = "Team Detail";
        }
    }
}