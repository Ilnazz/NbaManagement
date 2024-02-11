using NbaManagement.Database;
using NbaManagement.Enums;
using NbaManagement.Mvvm.Input;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;
using System.Collections.Generic;
using System.Linq;

namespace NbaManagement.ViewModels
{
    public class TeamDetailViewModel : TitledViewModel
    {
        #region Properties
        public int ShownTeamDetailIndex { get; }

        public Team Team { get; }

        public IEnumerable<Season> Seasons { get; }

        private Season _selectedSeason;
        public Season SelectedSeason
        {
            get => _selectedSeason;
            set => SetProperty(ref _selectedSeason, value);
        }

        public PlayerPositionViewModel PowerForwardPositionViewModel { get; }

        public PlayerPositionViewModel ShootingGuardPositionViewModel { get; }

        public PlayerPositionViewModel CenterPositionViewModel { get; }

        public PlayerPositionViewModel SmallForwardPositionViewModel { get; }

        public PlayerPositionViewModel PointGuardPositionViewModel { get; }
        #endregion

        public IRelayCommand SearchCommand { get; }

        private readonly SeasonService _seasonService;

        public TeamDetailViewModel(SeasonService seasonService, Team team, TeamDetail? shownTeamDetail = null)
        {
            _seasonService = seasonService;

            Title = "Team Detail";

            Team = team;
            ShownTeamDetailIndex = shownTeamDetail.HasValue ? (int)shownTeamDetail.Value : -1;

            Seasons = _seasonService.GetSeasons().OrderByDescending(season => season.Name);

            PowerForwardPositionViewModel = new PlayerPositionViewModel("PF", Team.Player.Where(p => p.IsPowerForward));
            ShootingGuardPositionViewModel = new PlayerPositionViewModel("SG", Team.Player.Where(p => p.IsShootingGuard));
            CenterPositionViewModel = new PlayerPositionViewModel("CP", Team.Player.Where(p => p.IsCenter));
            SmallForwardPositionViewModel = new PlayerPositionViewModel("SF", Team.Player.Where(p => p.IsSmallForward));
            PointGuardPositionViewModel = new PlayerPositionViewModel("PG", Team.Player.Where(p => p.IsPointGuard));

            //SearchCommand = new RelayCommand(() =>
            //{
                // Update other properties based on season
            //});
        }
    }
}