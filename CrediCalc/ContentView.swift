import SwiftUI

struct ContentView: View {
    @State private var loanAmount = ""
    @State private var percentage: Double? = nil
    @State private var loanTerm = ""
    @State private var monthlyPayment: Double = 0.0
    @State private var totalOverpayment: Double = 0.0
    @State private var totalPayment: Double = 0.0
    @State private var overpaymentPercentage: Double = 0.0

    var body: some View {
        Text("Loan calc")
            .padding()
            .foregroundStyle(.black)
            .font(.largeTitle)
        List {
            Section {
                TextField("Loan Amount", text: $loanAmount)
                    .padding(.all)
                    .keyboardType(.numberPad)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.green, lineWidth: 3)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white)
                            )
                            .shadow(
                                color: Color.gray.opacity(0.2), radius: 3,
                                x: 2, y: 2
                            )
                            .shadow(
                                color: Color.white.opacity(0.7), radius: 3,
                                x: -2, y: -2)
                    )
                TextField("Loan Term", text: $loanTerm)
                    .padding(.all)
                    .keyboardType(.numberPad)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.green, lineWidth: 3)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white)
                            )
                            .shadow(
                                color: Color.gray.opacity(0.2), radius: 3,
                                x: 2, y: 2
                            )
                            .shadow(
                                color: Color.white.opacity(0.7), radius: 3,
                                x: -2, y: -2)
                    )
                TextField("Stake, %", value: $percentage, format: .number)
                    .padding(.all)
                    .keyboardType(.numberPad)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.green, lineWidth: 3)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white)
                            )
                            .shadow(
                                color: Color.gray.opacity(0.2), radius: 3,
                                x: 2, y: 2
                            )
                            .shadow(
                                color: Color.white.opacity(0.7), radius: 3,
                                x: -2, y: -2)
                    )
            }
            .listRowBackground(Color.clear)
            Section {
                Button(action: {
                    let loanAmount = Double(self.loanAmount) ?? 0.0
                    let interestRate =
                        Double(self.percentage ?? 0.0) / 12.0 / 100.0
                    let months = Double(self.loanTerm) ?? 0.0

                    let numerator =
                        loanAmount * interestRate
                        * pow(1 + interestRate, months)
                    let denominator = pow(1 + interestRate, months) - 1
                    self.monthlyPayment = numerator / denominator
                    self.totalPayment = self.monthlyPayment * months
                    self.totalOverpayment = self.totalPayment - loanAmount
                    self.overpaymentPercentage =
                        (self.totalOverpayment / loanAmount) * 100.0
                }) {
                    Text("Сalculate")
                        .foregroundStyle(.white)
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.blue)
                                .shadow(
                                    color: Color.black.opacity(0.2), radius: 3,
                                    x: 2, y: 2
                                )
                                .shadow(
                                    color: Color.white.opacity(0.7), radius: 3,
                                    x: -2, y: -2)
                        )
                }
            }
            .listRowBackground(Color.clear)
            Section {
                VStack {
                    Text("Monthly payment")
                        .font(.title)
                        .foregroundStyle(.cyan)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(String(format: "%.2f", self.monthlyPayment))
                        .lineLimit(nil)
                        .foregroundStyle(.indigo)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.orange, lineWidth: 3)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white)
                        )
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                        .shadow(
                            color: Color.white.opacity(0.7), radius: 3, x: -2,
                            y: -2)
                )
                HStack {
                    Text("Loan Amount")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                    Text(String(self.loanAmount))
                        .font(.headline)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.blue, lineWidth: 3)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white)
                        )
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                        .shadow(
                            color: Color.white.opacity(0.7), radius: 3, x: -2,
                            y: -2)
                )
                HStack {
                    Text("Opverpayment")
                        .font(.headline)
                        .foregroundStyle(.green)
                    Text(String(format: "%.2f", self.totalOverpayment))
                        .font(.headline)
                        .foregroundStyle(.pink)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.purple, lineWidth: 3)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white)
                        )
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                        .shadow(
                            color: Color.white.opacity(0.7), radius: 3, x: -2,
                            y: -2)
                )
                HStack {
                    Text("Total amount of payments")
                        .font(.headline)
                        .foregroundStyle(.mint)
                    Text(String(format: "%.2f", self.totalPayment))
                        .font(.headline)
                        .foregroundStyle(.brown)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.teal, lineWidth: 3)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white)
                        )
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                        .shadow(
                            color: Color.white.opacity(0.7), radius: 3, x: -2,
                            y: -2)
                )
                HStack {
                    Text("Overpayment Interest")
                        .font(.headline)
                        .foregroundStyle(.teal)
                    Text(String(format: "%.2f%%", self.overpaymentPercentage))
                        .font(.headline)
                        .foregroundStyle(.green)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.purple, lineWidth: 3)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color(UIColor.systemBackground))
                        )
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                        .shadow(
                            color: Color.white.opacity(0.7), radius: 3, x: -2,
                            y: -2)
                )
            }
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        //                .background(Color(UIColor.systemGray6))
        //                .cornerRadius(25)
    }
}

#Preview {
    ContentView()
}
