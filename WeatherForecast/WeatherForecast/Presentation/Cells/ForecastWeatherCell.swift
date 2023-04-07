//
//  ForecastWeatherCell.swift
//  WeatherForecast
//
//  Created by 박재우 on 2023/04/04.
//

import UIKit

final class ForecastWeatherCell: UICollectionViewCell {
    static let identifier = "ForcastWeatherCell"

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    private lazy var atmosphericTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.sun.fill")
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, atmosphericTemperatureLabel, weatherImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        addSubview(stackView)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepare(model: ForecastViewModel) {
        dateLabel.text = DateFormatter().transWeahterDateForm(from: model.forecastInformation.forecastDate)
        
        
        
        atmosphericTemperatureLabel.text = model.forecastInformation.forecastDegree + "˚"
        weatherImage.image = UIImage(named: model.forecastEmogi)
    }
}

private extension DateFormatter {
    func transWeahterDateForm(from date: String) -> String {
        guard let temp = stringToDate(from: date) else { return "" }
        self.dateFormat = "MM/dd(E) HH시"
        self.locale = Locale(identifier:"ko_KR")
        return self.string(from: temp)
    }

    private func stringToDate(from date: String) -> Date? {
        self.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let data = self.date(from: date)
        return data
    }
}
